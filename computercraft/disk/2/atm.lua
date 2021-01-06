function main()
    modem = peripheral.wrap("left")
    modem.open(69)
    showMenu()
    modem.close(69)
end

function showMenu()
    while true do
        print("Welcome to the Bank API")
        print("Please make a selection")
        print("1. Deposit")
        print("2. Withdraw")
        print("3. Exit")
        userInput = read()
        if(userInput == "1") then
            print("DEPOSITING")
        elseif(userInput == "2") then
            print("WITHDRAWING")
            getAllChestItems()
        elseif(userInput == "3") then
            break
        end
    end

end


function getAllChestItems()
    tbl = peripheral.wrap("back")
    for key,value in pairs( tbl.list() ) do
        --print(key, value)
        for kk,vv in pairs(value) do
            print(kk,vv)
        end
    end
end

function printTable(aTable)
    table.foreach(aTable, function(k,v)
        print(v)
    end)
end

function getID()
    return disk.getID("right")
end

function checkValidDisk()
    return disk.hasData("right")
end

main()
