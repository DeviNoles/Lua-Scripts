function main()
    print("Welcome to the HUB API")
    print("Waiting for Rednet Transmissions...")
    modem = peripheral.wrap("left")
    modem.open(69)
    while true do
        event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")
 --       print(message)
        parseRequest(message)
    end
end

function getUserAccount()
    print("GET USER ACCOUNT")
end

function writeUserAccount(amount)
    --print(amount)
    acc = {user = "TheFrogEngineer", balance = amount}
    function save(acc)
        local file = fs.open("./disk2/ledger","w")
        file.writeLine(textutils.serialize(acc))
        print(textutils.serialize(acc))
        file.close()
    end
    save(acc)
end

function parseRequest(request)
    words = {}
    for word in request:gmatch("%S+") do table.insert(words, word) end
    --printTable(words)
    if(words[1]=="GET") then
        getUserAccount()
    elseif(words[1]=="PUT") then
        --print(words[2]) -- should be the PUT X - x value
        writeUserAccount(words[2])
    end    
end

function printTable(aTable)
    table.foreach(aTable, function(k,v)
        print(v)
    end)
end
main()
