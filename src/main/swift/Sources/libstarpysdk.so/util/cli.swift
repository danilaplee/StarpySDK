import Foundation;
import Dispatch;

class cliTool {

	let sdk:StarpySDKMain

    init(_ instance:StarpySDKMain) {
        sdk = instance;
    }


    func staticMode() {

    	var stop = false;
        
    	if(getArgumentById(id: 1) == nil 
    	|| getArgumentById(id: 2) == nil) {

    		//STOP THE APP WHEN NOT ENOUGH ARGUMENTS
    		return printUsage();
    	}

    	//INIT THE CLI MODE
        let action 	= getArgumentById(id: 1)!["value"] as! String
        let param 	= getArgumentById(id: 2)!["value"] as! String

        if(action == "-request_login") 
        {
            print("==============================")
        	print("======== request_login =======")
            print("==============================")
        	sdk.RequestLogin(param, done: { (status) in
                print(status.toJSONString())
                print("==============================")
                stop = true;
            })
        }

        if(action == "-confirm_login") 
        {
            
            if(getArgumentById(id: 3) == nil) {
                return printUsage();
            }
         
            print("==============================")
        	print("======== confirm_login =======") 
            print("==============================")  
            let param2 = getArgumentById(id: 3)!["value"] as! String
            sdk.ConfirmLogin(param2, done: { (status) in
                print(status.toJSONString());
                print("==============================")
                stop = true;
            })
        }

        while stop == false {
            
        }
        return;

    }
    
    func printUsage() {
        let executableName = CommandLine.arguments[0] as String

        print("================ SDK METHODS ===============")
        print("\(executableName) -request_login phone")
        print("\(executableName) -confirm_login phone code")
        print("============================================")
    }
    
    func getOption(_ option: String) -> (OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func getArgumentById(id:Int) -> [String:Any]? 
    {
        let contains = CommandLine.arguments.indices.contains(id)
    	if(contains == true)
    	{
	        let argument 		= CommandLine.arguments[id]
	        let start_index 	= argument.characters.index(argument.startIndex, offsetBy: 0)
	        let (option, value) = getOption(argument.substring(from: start_index))
	        return ["option":option, "value":value] as [String : Any]
    	}
    	else {
			return nil
    	}
    }
}

enum OptionType: String {
    case request_login  = "-request_login"
    case confirm_login  = "-confirm_login"
    case unknown
    
    init(value: String) {
        switch value {
            case "-confirm_login"   :   self = .confirm_login
            case "-request_login"   :   self = .request_login
            default                 :   self = .unknown
        }
    }
}
