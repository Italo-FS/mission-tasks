commands.add_command(
  "criar_tarefas_teste",
  "Gera 3 tarefas de teste com subtarefas para o jogador.",
  ---@param command CustomCommandData
  function(command)
    local player = game.get_player(command.player_index)
    if not (player and player.valid) then return end

    -- garante estrutura GUI
    local gui = Gui and State.ensure_player_state(player) or { }

    --- Create a new task
    --- @param task TaskData {
    ---   title: string,
    ---   description: string,
    ---   status: string,
    ---   icon: Sprite,
    ---   subtasks: Subtask[],
    --- }
    local function new_task(task)
      if not task.title then return end
      Tasks.add_task(player, {
        title     = task.title,
        desc      = task.desc or "",
        status    = task.status or "todo",
        icon      = task.icon,
        subtasks  = task.subtasks or {},
      })
    end

    --------------------------------------------------------------------
    new_task({
      title = "Build Radar",
      desc = "Install a radar near the base.",
      status = "todo",
      icon = { type = "item", name = "radar" },
      subtasks = {
        { id = 1, title = "Produce 20 electric cables", done = false },
        { id = 2, title = "Craft 5 electronic circuits", done = false },
        { id = 3, title = "Manufacture and place the radar", done = false },
      },
    })

    new_task({
      title = "Expand Power Grid",
      desc = "Increase energy production to support new structures.",
      status = "todo",
      icon = { type = "item", name = "steam-engine" },
      subtasks = {
        { id = 1, title = "Mine additional coal", done = false },
        { id = 2, title = "Build 3 boilers", done = false },
        { id = 3, title = "Place 5 steam engines", done = false },
      },
    })

    new_task({
      title = "Defend the Perimeter",
      desc = "Strengthen defenses against incoming attacks.",
      status = "todo",
      icon = { type = "item", name = "gun-turret" },
      subtasks = {
        { id = 1, title = "Craft 10 gun turrets", done = false },
        { id = 2, title = "Produce 100 firearm magazines", done = false },
        { id = 3, title = "Deploy turrets around the outer wall", done = false },
      },
    })

    new_task({
      title = "Automate Copper Processing",
      desc = "Create a basic copper plate production line.",
      status = "todo",
      icon = { type = "item", name = "copper-plate" },
      subtasks = {
        { id = 1, title = "Mine copper ore", done = false },
        { id = 2, title = "Place 3 furnaces", done = false },
        { id = 3, title = "Set up copper belt to chest", done = false },
      },
    })

    new_task({
      title = "Setup Science Lab",
      desc = "Start researching basic technologies.",
      status = "todo",
      icon = { type = "item", name = "lab" },
      subtasks = {
        { id = 1, title = "Craft and place a lab", done = false },
        { id = 2, title = "Produce 10 red science packs", done = false },
        { id = 3, title = "Insert science packs into lab", done = false },
      },
    })

    new_task({
      title = "Establish Iron Mining Outpost",
      desc = "Secure a remote iron patch for increased production.",
      status = "todo",
      icon = { type = "item", name = "electric-mining-drill" },
      subtasks = {
        { id = 1, title = "Place 4 electric mining drills", done = false },
        { id = 2, title = "Connect power poles", done = false },
        { id = 3, title = "Transport ore via belts to main base", done = false },
      },
    })

    new_task({
      title = "Create Ammo Factory",
      desc = "Automate firearm magazine production.",
      status = "todo",
      icon = { type = "item", name = "firearm-magazine" },
      subtasks = {
        { id = 1, title = "Place 2 assemblers", done = false },
        { id = 2, title = "Feed iron plates automatically", done = false },
        { id = 3, title = "Store output in chests", done = false },
      },
    })

    new_task({
      title = "Oil Processing Setup",
      desc = "Start basic oil refining and fluid handling.",
      status = "todo",
      icon = { type = "item", name = "oil-refinery" },
      subtasks = {
        { id = 1, title = "Build and place oil refinery", done = false },
        { id = 2, title = "Lay down basic pipe network", done = false },
        { id = 3, title = "Produce petroleum gas", done = false },
      },
    })

    new_task({
      title = "Build Vehicle",
      desc = "Create a car for faster exploration.",
      status = "todo",
      icon = { type = "item", name = "car" },
      subtasks = {
        { id = 1, title = "Craft engine units", done = false },
        { id = 2, title = "Assemble a car", done = false },
        { id = 3, title = "Fuel it with coal", done = false },
      },
    })

    new_task({
      title = "Repair Damaged Wall",
      desc = "Fix breaches in the outer defensive wall.",
      status = "todo",
      icon = { type = "item", name = "stone-wall" },
      subtasks = {
        { id = 1, title = "Gather stone bricks", done = false },
        { id = 2, title = "Remove damaged wall sections", done = false },
        { id = 3, title = "Rebuild wall in vulnerable areas", done = false },
      },
    })


    Gui.refresh_tasks()
  end
)