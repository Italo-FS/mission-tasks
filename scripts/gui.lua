if not Gui then Gui = {} end

function Gui.start()
  if not Gui then Gui = {} end
  storage.player_states = storage.player_states or {}
end

--- Initialize GUI for a player
--- @param player LuaPlayer
function Gui.init_player_gui(player)
  MainFrame.destroy(player)
  TaskFrame.destroy(player)
end

function Gui.update_task_view_panel(player, task_id)
  local task_detail_pane = MainFrame.getTaskDetailFrame(player)
  if not (task_detail_pane and task_detail_pane.valid) then return end
  TaskView.draw(task_detail_pane, task_id, player)
end

function Gui.close_all_secondaries_frames(player)
  -- Destroy TaskFrame
  local task_frame = player.gui.screen["mission-tasks-task-frame"]
  if task_frame and task_frame.valid then task_frame.destroy() end

  -- Destroy SubtaskFrame
  local subtask_frame = player.gui.screen["mission-tasks-subtask-frame"]
  if subtask_frame and subtask_frame.valid then subtask_frame.destroy() end

  -- Destroy ImportFrame
  local import_frame = player.gui.screen["mission-tasks-import-frame"]
  if import_frame and import_frame.valid then import_frame.destroy() end

  -- Destroy ExportFrame
  local export_frame = player.gui.screen["mission-tasks-export-frame"]
  if export_frame and export_frame.valid then export_frame.destroy() end
  
  -- Destroy SettingsFrame
  local settings_frame = player.gui.screen["mission-tasks-settings-frame"]
  if settings_frame and settings_frame.valid then settings_frame.destroy() end

  -- Destroy InfoFrame
  local info_frame = player.gui.screen["mission-tasks-info-frame"]
  if info_frame and info_frame.valid then info_frame.destroy() end

  -- Destroy InfoFrame
  local confirm_frame = player.gui.screen["mission-tasks-confirm-frame"]
  if confirm_frame and confirm_frame.valid then confirm_frame.destroy() end
end

function Gui.destroy_all(player)
  Gui.close_all_secondaries_frames(player)

  -- Destroy MainFrame
  local main_frame = player.gui.screen["mission-tasks-main-frame"]
  if main_frame and main_frame.valid then main_frame.destroy() end
end

--- Updates the TaskView for a player, and TaskList and TaskHud for all players
function Gui.refresh_tasks(player)
  local function _update_player_tasks(player)
    TaskView.redraw(player)
    TaskList.redraw()
    TaskHud.redraw()
  end
  
  if (not player) then
    for _, player in pairs(game.players) do
      _update_player_tasks(player)
    end
  else
    _update_player_tasks(player)
  end
end

---@param parent LuaGuiElement
---@param name string
---@return LuaGuiElement|nil
function Gui.find_element(parent, name)
  if not parent or not parent.valid then return nil end

  -- Se o elemento atual tem o nome desejado, retorna ele
  if parent.name == name then
    return parent
  end

  -- Percorre os filhos recursivamente
  for _, child in pairs(parent.children) do
    local found = Gui.find_element(child, name)
    if found then
      return found
    end
  end

  return nil -- Se não encontrar
end
