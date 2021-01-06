function main()
    diamnd = 100
    emerld = 50
    gld = 20
    irn = 10
    rstone = 5
    cl = 1    
    modem = peripheral.wrap("left")
    modem.open(69)
    depositChest = peripheral.wrap("top")
    storageChest = peripheral.wrap("back")
    showMenu()
    modem.close(69)
end

function initDepositRequest()
    --print(textutils.serialise(depositChest.list()))
    pushAllChestItems(getAllChestItems())
end

function pushAllChestItems(totalSum)
    for h = 1, depositChest.size() do
        depositChest.pushItems(peripheral.getName(storageChest), h)
    end  
    modem.transmit(69,69,"PUT "..totalSum)
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
            initDepositRequest()
           -- print("DEPOSITING")
        elseif(userInput == "2") then
            --print("WITHDRAWING")
            getAllChestItems()
        elseif(userInput == "3") then
            break
        end
    end

end


function getAllChestItems()
    outterTable = depositChest.list()
    totalSum = 0
    for key,value in pairs( outterTable ) do
        --print(key, value)
        for innerKey, innerValue in pairs(value) do
            print("INNER KEY IS: "..innerKey, "INNER VALUE IS: "..innerValue)
            if(innerKey=="name" and innerValue=="minecraft:diamond") then
                totalSum = totalSum + 100
                print("Added 100")
                print("Total Sum is now: "..totalSum)
            elseif(innerKey=="name" and innerValue=="minecraft:emerald") then
                totalSum = totalSum + 50
                print("Added 50")
                print("Total Sum is now: "..totalSum)
            elseif(innerKey=="name" and innerValue=="minecraft:gold_ingot") then
                totalSum = totalSum + 20
                print("Added 20")
                print("Total Sum is now: "..totalSum)
            elseif(innerKey=="name" and innerValue=="minecraft:iron_ingot") then
                totalSum = totalSum + 10
                print("Added 10")
                print("Total Sum is now: "..totalSum)
            elseif(innerKey=="name" and innerValue=="minecraft:redstone") then
                totalSum = totalSum + 5
                print("Added 5")
                print("Total Sum is now: "..totalSum)
            elseif(innerKey=="name" and innerValue=="minecraft:coal") then
                totalSum = totalSum + 1
                print("Added 1")
                print("Total Sum is now: "..totalSum)
            end
        end
    end
    return totalSum
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
