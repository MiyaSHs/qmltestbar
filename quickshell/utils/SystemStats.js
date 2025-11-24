.pragma library

function readFile(path) {
    try {
        var xhr = new XMLHttpRequest()
        xhr.open("GET", "file://" + path, false)
        xhr.send()
        if (xhr.status === 0 || (xhr.status >= 200 && xhr.status < 300)) {
            return xhr.responseText
        }
    } catch (e) {
        console.warn("Failed to read", path, e)
    }
    return ""
}

function parseCpuStat(text) {
    var lines = text.split("\n")
    if (lines.length === 0) return null
    var parts = lines[0].trim().split(/\s+/)
    if (parts.length < 5 || parts[0] !== "cpu") return null
    var user = parseInt(parts[1])
    var nice = parseInt(parts[2])
    var system = parseInt(parts[3])
    var idle = parseInt(parts[4])
    var iowait = parseInt(parts[5] || 0)
    var irq = parseInt(parts[6] || 0)
    var softirq = parseInt(parts[7] || 0)
    var steal = parseInt(parts[8] || 0)
    var totalIdle = idle + iowait
    var totalNonIdle = user + nice + system + irq + softirq + steal
    var total = totalIdle + totalNonIdle
    return { total: total, idle: totalIdle }
}

function readCpuUsage(previous) {
    var stat = parseCpuStat(readFile("/proc/stat"))
    if (!stat || !previous) return { usage: 0, snapshot: stat }
    var totalDelta = stat.total - previous.total
    var idleDelta = stat.idle - previous.idle
    var usage = totalDelta > 0 ? (1 - idleDelta / totalDelta) * 100 : 0
    return { usage: usage, snapshot: stat }
}

function readMemoryUsage() {
    var info = readFile("/proc/meminfo")
    var lines = info.split("\n")
    var memTotal = 0
    var memAvailable = 0
    lines.forEach(function (line) {
        if (line.startsWith("MemTotal")) {
            memTotal = parseInt(line.split(/\s+/)[1])
        } else if (line.startsWith("MemAvailable")) {
            memAvailable = parseInt(line.split(/\s+/)[1])
        }
    })
    if (memTotal === 0) return { used: 0, total: 0 }
    var used = memTotal - memAvailable
    return { used: used, total: memTotal, percent: (used / memTotal) * 100 }
}
