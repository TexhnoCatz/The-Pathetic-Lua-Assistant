local SHORT_DELAY = 1
local LONG_DELAY = 2

function wait(seconds)
    local start = os.time()
    repeat
    until os.time() > start + seconds
end

local function assistant()
    print(
        'This is Lua Assistant. To stop the program, type "exit". Here are the available commands: 1. what date is today 2. tell me a joke 3. math'
    )

    local userInput = io.read():lower()

    if userInput == "what date is today" then
        local date = os.date("*t")
        local time = os.date("*t")
        print("Today is " .. os.date("%A, %m %B %Y |"), ("%02d:%02d:%02d"):format(time.hour, time.min, time.sec))
        wait(LONG_DELAY)
        return assistant()
    elseif userInput == "tell me a joke" then
        local function joke()
            local random = math.random(1, 5)
            local jokes = {
                "What do you call fake spaghetti?",
                "What do you call cheese that isn't yours?",
                "Why did the math book look sad?",
                "What did one ocean say to the other ocean?",
                "Why don't scientists trust atoms?"
            }
            local Janswer = {
                "An impasta.",
                "Nacho cheese.",
                "Because it had too many problems.",
                "Nothing, they just waved.",
                "Because they make up everything!"
            }

            print(jokes[random])
            wait(LONG_DELAY)
            print(Janswer[random])
            wait(SHORT_DELAY)
            print("Want more? (yes/no)")
            userInput = io.read():lower()

            if userInput == "yes" then
                return joke()
            elseif userInput == "no" then
                return assistant()
            else
                print("Invalid input. Please enter 'yes' or 'no'.")
                return assistant()
            end
        end

        joke()
    elseif userInput == "exit" then
        print("Exiting Lua Assistant.")
    elseif userInput == "math" then
        local function math()
            function add(x, y)
                return x + y
            end

            function subtract(x, y)
                return x - y
            end

            function multiply(x, y)
                return x * y
            end

            function divide(x, y)
                if y ~= 0 then
                    return x / y
                else
                    return "Error: Division by zero"
                end
            end

            function getUserInput()
                print("Enter the first number:")
                local num1 = tonumber(io.read())

                print("Enter the operation (+, -, *, /):")
                local operation = io.read()

                print("Enter the second number:")
                local num2 = tonumber(io.read())

                return num1, operation, num2
            end

            function calculate()
                local num1, operation, num2 = getUserInput()

                local result
                if operation == "+" then
                    result = add(num1, num2)
                elseif operation == "-" then
                    result = subtract(num1, num2)
                elseif operation == "*" then
                    result = multiply(num1, num2)
                elseif operation == "/" then
                    result = divide(num1, num2)
                else
                    result = "Error: Invalid operation"
                end

                print("Result:", result)
                wait(SHORT_DELAY)
                print("Want more? (yes/no)")
                userInput = io.read():lower()

                if userInput == "yes" then
                    return math()
                elseif userInput == "no" then
                    return assistant()
                else
                    print("Invalid input. Please enter 'yes' or 'no'.")
                    return assistant()
                end
            end
            wait(SHORT_DELAY)
            print("Sure thing!")
            wait(SHORT_DELAY)
            calculate()
        end
        math()
    else
        print("Invalid command. Please enter a valid command.")
        return assistant()
    end
end

assistant()