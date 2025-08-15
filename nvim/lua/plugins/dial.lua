return {
  "monaqa/dial.nvim",
  recommended = true,
  desc = "Increment and decrement numbers, dates, and more",
  -- stylua: ignore  
  keys = function()
    local dial = require("dial.map")
    return {
      { "<C-a>", dial.inc_normal(), desc = "Increment", mode = "n" },
      { "<C-x>", dial.dec_normal(), desc = "Decrement", mode = "n" },
      { "g<C-a>", dial.inc_gnormal(), desc = "Increment", mode = "n" },
      { "g<C-x>", dial.dec_gnormal(), desc = "Decrement", mode = "n" },
      { "<C-a>", dial.inc_visual(), desc = "Increment", mode = "v" },
      { "<C-x>", dial.dec_visual(), desc = "Decrement", mode = "v" },
      { "g<C-a>", dial.inc_gvisual(), desc = "Increment", mode = "v" },
      { "g<C-x>", dial.dec_gvisual(), desc = "Decrement", mode = "v" },
    }
  end,
  config = function()
    local augend = require("dial.augend")

    local logical_alias = augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    })

    local ordinal_numbers = augend.constant.new({
      elements = {
        "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth",
        "eleventh", "twelfth", "thirteenth", "fourteenth", "fifteenth", "sixteenth", "seventeenth", "eighteenth", "nineteenth", "twentieth",
        "twenty-first", "twenty-second", "twenty-third", "twenty-fourth", "twenty-fifth", "twenty-sixth", "twenty-seventh", "twenty-eighth", "twenty-ninth", "thirtieth",
        "thirty-first", "thirty-second", "thirty-third", "thirty-fourth", "thirty-fifth", "thirty-sixth", "thirty-seventh", "thirty-eighth", "thirty-ninth", "fortieth",
        "forty-first", "forty-second", "forty-third", "forty-fourth", "forty-fifth", "forty-sixth", "forty-seventh", "forty-eighth", "forty-ninth", "fiftieth",
        "fifty-first", "fifty-second", "fifty-third", "fifty-fourth", "fifty-fifth", "fifty-sixth", "fifty-seventh", "fifty-eighth", "fifty-ninth", "sixtieth",
        "sixty-first", "sixty-second", "sixty-third", "sixty-fourth", "sixty-fifth", "sixty-sixth", "sixty-seventh", "sixty-eighth", "sixty-ninth", "seventieth",
        "seventy-first", "seventy-second", "seventy-third", "seventy-fourth", "seventy-fifth", "seventy-sixth", "seventy-seventh", "seventy-eighth", "seventy-ninth", "eightieth",
        "eighty-first", "eighty-second", "eighty-third", "eighty-fourth", "eighty-fifth", "eighty-sixth", "eighty-seventh", "eighty-eighth", "eighty-ninth", "ninetieth",
        "ninety-first", "ninety-second", "ninety-third", "ninety-fourth", "ninety-fifth", "ninety-sixth", "ninety-seventh", "ninety-eighth", "ninety-ninth", "hundredth"
      },
      word = false,
      cyclic = false,
    })
    local weekdays = augend.constant.new({
      elements = {
        "Monday", "Tuesday", "Wednesday", "Thursday",
        "Friday", "Saturday", "Sunday"
      },
      word = true,
      cyclic = true,
    })

    local months_full = augend.constant.new({
      elements = {
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      },
      word = true,
      cyclic = true,
    })

    local capital_ordinal_numbers = augend.constant.new({
      elements = {
        "First", "Second", "Third", "Fourth", "Fifth", "Sixth", "Seventh", "Eighth", "Ninth", "Tenth",
        "Eleventh", "Twelfth", "Thirteenth", "Fourteenth", "Fifteenth", "Sixteenth", "Seventeenth", "Eighteenth", "Nineteenth", "Twentieth",
        "Twenty-first", "Twenty-second", "Twenty-third", "Twenty-fourth", "Twenty-fifth", "Twenty-sixth", "Twenty-seventh", "Twenty-eighth", "Twenty-ninth", "Thirtieth",
        "Thirty-first", "Thirty-second", "Thirty-third", "Thirty-fourth", "Thirty-fifth", "Thirty-sixth", "Thirty-seventh", "Thirty-eighth", "Thirty-ninth", "Fortieth",
        "Forty-first", "Forty-second", "Forty-third", "Forty-fourth", "Forty-fifth", "Forty-sixth", "Forty-seventh", "Forty-eighth", "Forty-ninth", "Fiftieth",
        "Fifty-first", "Fifty-second", "Fifty-third",  "Fifty-fourth", "Fifty-fifth", "Fifty-sixth", "Fifty-seventh", "Fifty-eighth", "Fifty-ninth", "Sixtieth",
        "Sixty-first", "Sixty-second", "Sixty-third", "Sixty-fourth", "Sixty-fifth", "Sixty-sixth", "Sixty-seventh", "Sixty-eighth", "Sixty-ninth", "Seventieth",
        "Seventy-first", "Seventy-second", "Seventy-third", "Seventy-fourth", "Seventy-fifth", "Seventy-sixth", "Seventy-seventh", "Seventy-eighth", "Seventy-ninth", "Eightieth",
        "Eighty-first", "Eighty-second", "Eighty-third", "Eighty-fourth", "Eighty-fifth", "Eighty-sixth", "Eighty-seventh", "Eighty-eighth", "Eighty-ninth", "Ninetieth",
        "Ninety-first", "Ninety-second", "Ninety-third", "Ninety-fourth", "Ninety-fifth", "Ninety-sixth", "Ninety-seventh", "Ninety-eighth", "Ninety-ninth", "Hundredth"
      },
      word = false,
      cyclic = false,
    })
    -- Lowercase weekdays    
    local lowercase_weekdays = augend.constant.new({
      elements = {
        "monday", "tuesday", "wednesday", "thursday",
        "friday", "saturday", "sunday"
      },
      word = true,
      cyclic = true,
    })

    -- Lowercase months  
    local lowercase_months = augend.constant.new({
      elements = {
        "january", "february", "march", "april", "may", "june",
        "july", "august", "september", "october", "november", "december"
      }
    })

    local numeric_ordinals = augend.constant.new({
      elements = {
        "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th", "10th",
        "11th", "12th", "13th", "14th", "15th", "16th", "17th", "18th", "19th", "20th",
        "21st", "22nd", "23rd", "24th", "25th", "26th", "27th", "28th", "29th", "30th",
        "31st", "32nd", "33rd", "34th", "35th", "36th", "37th", "38th", "39th", "40th",
        "41st", "42nd", "43rd", "44th", "45th", "46th", "47th", "48th", "49th", "50th",
        "51st", "52nd", "53rd", "54th", "55th", "56th", "57th", "58th", "59th", "60th",
        "61st", "62nd", "63rd", "64th", "65th", "66th", "67th", "68th", "69th", "70th",
        "71st", "72nd", "73rd", "74th", "75th", "76th", "77th", "78th", "79th", "80th",
        "81st", "82nd", "83rd", "84th", "85th", "86th", "87th", "88th", "89th", "90th",
        "91st", "92nd", "93rd", "94th", "95th", "96th", "97th", "98th", "99th", "100th"
      },
      word = false,
      cyclic = false,
    })

    local capitalized_boolean = augend.constant.new({
      elements = { "True", "False" },
      word = true,
      cyclic = true,
    })

    local groups = {
      text = { -- Special group for .txt files  
        augend.integer.alias.decimal,
        augend.constant.alias.bool,
        augend.constant.new({
          elements = {"yes", "no"},
          word = true,
          cyclic = true,
        }),
        augend.date.alias["%Y-%m-%d"],
        ordinal_numbers,
      },
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        numeric_ordinals,
        ordinal_numbers,
        capital_ordinal_numbers,
        lowercase_months,
        lowercase_weekdays,
        weekdays,
        months_full,
        capitalized_boolean,
        augend.constant.alias.bool,
        logical_alias,
      },
      vue = {
        augend.constant.new({ elements = { "let", "const" } }),
        augend.hexcolor.new({ case = "lower" }),
        augend.hexcolor.new({ case = "upper" }),
      },
      typescript = {
        augend.constant.new({ elements = { "let", "const" } }),
      },
      css = {
        augend.hexcolor.new({ case = "lower" }),
        augend.hexcolor.new({ case = "upper" }),
      },
      markdown = {
        augend.constant.new({ elements = { "[ ]", "[x]" }, word = false, cyclic = true }),
        augend.misc.alias.markdown_header,
      },
      json = {
        augend.semver.alias.semver,
      },
      lua = {
        augend.constant.new({ elements = { "and", "or" }, word = true, cyclic = true }),
      },
      python = {
        augend.constant.new({ elements = { "and", "or" } }),
      },
    }

    -- Copy defaults to each group
    for name, group in pairs(groups) do
      if name ~= "default" then
      vim.list_extend(group, groups.default)
    end
    end

      require("dial.config").augends:register_group(groups)
  end,
}
