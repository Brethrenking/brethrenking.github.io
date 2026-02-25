local grid = {}

-- Function to parse the grid data from a single line
function parse_grid(line)
    local i = 1
    local row = 1
    local col = 1

    while i <= #line do
        local char = line:sub(i, i)

        if char == 
        "(" then
            col = 1
        elseif char == ")" then
            row = row + 1
            col = 1
        elseif char == "|" then
            col = col + 1
        else
            grid[row] = grid[row] or {}
            grid[row][col] = tonumber(char)
        end

        i = i + 1
    end
end

-- Function to display a column of the grid
function showcol(col_index)
    for row, values in pairs(grid) do
        print(values[col_index + 1]) -- Adjust for 0-based indexing
    end
end

-- Function to display a row of the grid
function showrow(row_index)
    local values = grid[row_index + 1] -- Adjust for 0-based indexing
    for i = 1, #values do
        print(values[i])
    end
end

-- Read the grid data from the file
local file = io.open("grid.txt", "r")
local line = file:read("*line")
file:close()

parse_grid(line)

-- Process commands from standard input
while true do
    local command = io.read("*line")

    if command == "showcol" then
        local col_index = tonumber(io.read("*line"))
        showcol(col_index)
    elseif command == "showrow" then
        local row_index = tonumber(io.read("*line"))
        showrow(row_index)
    else
        break
    end
end