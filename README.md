# Quickshell Bar Demo

This repository contains a modular [Quickshell](https://github.com/pflouret/quickshell) bar layout focused on Hyprland users.  The bar defaults to a left-aligned vertical layout with WinXP-inspired theming, but all modules and styling are isolated so the orientation or theme can be swapped quickly.

## What is inside?

- A single `main.qml` entry point that launches the bar.
- A `Bar` container that handles orientation, spacing, padding, and background drawing.
- Individual modules (workspaces, window title, clock, system stats, and a placeholder menu) that can be rearranged or replaced easily.
- Theme objects under `themes/` so you can switch from the WinXP gradient look to a modern flat look (or create your own) without touching the module code.

## Running the bar

1. Install Quickshell following the upstream instructions.
2. Start the bar with:

   ```bash
   quickshell run quickshell/main.qml
   ```

   By default it will pin itself to the left of your primary monitor with a vertical layout.

3. Edit the `quickshell/main.qml` file to change the `orientation` (`Qt.Vertical` or `Qt.Horizontal`) or switch the `themeName` (`"winxp"` or `"modern"`).

## Customization tips

- Each module receives the current `orientation` and `theme` from the bar, so you only need to change those values in `main.qml` for the entire layout.
- To add or remove modules, edit the `modules` `ColumnLayout`/`RowLayout` block inside `Bar.qml`.
- Themes live in `quickshell/themes/`. Copy `WinXPTheme.qml` to a new file and edit the colors, gradients, and spacing to build a new style. Update `ThemeLoader.qml` to register the new theme name.

## Notes

- The Hyprland workspace model ships with a simple static list so the layout works without extra dependencies. Hook up real Hyprland IPC in `WorkspaceModule.qml` by replacing the `workspaceModel` with a live source when you are ready.
- The system stats module polls `/proc` for CPU and memory usage without external tools. If you prefer other sensors, drop in your own provider and keep the view code intact.

