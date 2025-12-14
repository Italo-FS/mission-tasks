commands.add_command(
  "generate-test-tasks",
  "Generates 3 random test tasks with subtasks for the player.",
  ---@param command CustomCommandData
  function(command)
    local player = game.get_player(command.player_index)
    if not (player and player.valid) then return end

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

    local tasks = {
      {
        title = "Build Radar Coverage",
        desc = "Install radar network for full map visibility.",
        status = "todo",
        icon = { type = "item", name = "radar" },
        subtasks = {
          { id = 1, title = "Craft 3 radars", done = false },
          { id = 2, title = "Place radars in key areas", done = false },
          { id = 3, title = "Verify full map coverage", done = false },
        },
      },
      {
        title = "Expand Power Infrastructure",
        desc = "Scale up energy production for factory growth.",
        status = "todo",
        icon = { type = "item", name = "medium-electric-pole" },
        subtasks = {
          { id = 1, title = "Build solar farm", done = false },
          { id = 2, title = "Install 10 accumulators", done = false },
          { id = 3, title = "Upgrade power lines", done = false },
        },
      },
      {
        title = "Fortify Base Defenses",
        desc = "Upgrade perimeter security against biters.",
        status = "doing",
        icon = { type = "item", name = "laser-turret" },
        subtasks = {
          { id = 1, title = "Research laser turret", done = false },
          { id = 2, title = "Craft 8 laser turrets", done = false },
          { id = 3, title = "Deploy along front line", done = false },
        },
      },
      {
        title = "Automate Green Circuits",
        desc = "Create continuous electronic circuit production.",
        status = "todo",
        icon = { type = "item", name = "electronic-circuit" },
        subtasks = {
          { id = 1, title = "Place 4 assembling machines", done = false },
          { id = 2, title = "Setup copper/iron input", done = false },
          { id = 3, title = "Balance output inserters", done = false },
        },
      },
      {
        title = "Launch Rocket Silo",
        desc = "Complete space program with satellite launch.",
        status = "todo",
        icon = { type = "item", name = "rocket-silo" },
        subtasks = {
          { id = 1, title = "Build rocket silo", done = false },
          { id = 2, title = "Produce rocket fuel", done = false },
          { id = 3, title = "Launch satellite", done = false },
        },
      },
      {
        title = "Iron Gearbox Production",
        desc = "Fully automate mechanical component manufacturing.",
        status = "todo",
        icon = { type = "item", name = "iron-gear-wheel" },
        subtasks = {
          { id = 1, title = "Mine iron outpost", done = false },
          { id = 2, title = "Build 6 smelters", done = false },
          { id = 3, title = "Assemble 200 gearboxes", done = false },
        },
      },
      {
        title = "Oil Processing Plant",
        desc = "Establish automated crude oil refining operations.",
        status = "todo",
        icon = { type = "item", name = "oil-refinery" },
        subtasks = {
          { id = 1, title = "Place 2 oil refineries", done = false },
          { id = 2, title = "Build chemical plant", done = false },
          { id = 3, title = "Setup pipe network", done = false },
        },
      },
      {
        title = "Plastic Production Line",
        desc = "Automate plastic bar manufacturing for advanced circuits.",
        status = "todo",
        icon = { type = "item", name = "plastic-bar" },
        subtasks = {
          { id = 1, title = "Process petroleum gas", done = false },
          { id = 2, title = "Craft 4 chemical plants", done = false },
          { id = 3, title = "Store in buffer chests", done = false },
        },
      },
      {
        title = "Train Station Upgrade",
        desc = "Improve rail network with automated train scheduling.",
        status = "doing",
        icon = { type = "item", name = "train-station" },
        subtasks = {
          { id = 1, title = "Build rail signals", done = false },
          { id = 2, title = "Configure train schedules", done = false },
          { id = 3, title = "Add waiting bay tracks", done = false },
        },
      },
      {
        title = "Uranium Processing",
        desc = "Start nuclear power generation with fuel cycle.",
        status = "todo",
        icon = { type = "item", name = "uranium-fuel-cell" },
        subtasks = {
          { id = 1, title = "Mine uranium outpost", done = false },
          { id = 2, title = "Build centrifuges", done = false },
          { id = 3, title = "Process Kovarex enrichment", done = false },
        },
      },
      {
        title = "Construction Robot Fleet",
        desc = "Deploy logistic network with construction capabilities.",
        status = "todo",
        icon = { type = "item", name = "construction-robot" },
        subtasks = {
          { id = 1, title = "Build roboport grid", done = false },
          { id = 2, title = "Craft 50 robots", done = false },
          { id = 3, title = "Place construction chests", done = false },
        },
      },
      {
        title = "Biters Research Lab",
        desc = "Unlock military technologies against alien threat.",
        status = "todo",
        icon = { type = "item", name = "military-science-pack" },
        subtasks = {
          { id = 1, title = "Produce military science", done = false },
          { id = 2, title = "Research artillery", done = false },
          { id = 3, title = "Deploy artillery wagons", done = false },
        },
      },
    }

    math.randomseed(game.tick)
    for i = 1, 3 do
      local random_index = math.random(#tasks)
      local random_task = tasks[random_index]
      new_task(random_task)
    end

    player.print("Tasks generated!")
    Gui.refresh_tasks()
  end
)
