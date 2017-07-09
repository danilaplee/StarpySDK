import Foundation;
import Dispatch;

class cliTool {

	let sdk:StarpySDKMain

    init(_ instance:StarpySDKMain) {
        sdk = instance;
    }


    func staticMode() {

    	var stop = false;

    	if(getArgumentById(id: 1)["value"] == nil ||
    		getArgumentById(id: 2)["value"] == nil) {
    		return printUsage();
    	}

        let action = getArgumentById(id: 1)["value"] as! String
        let param = getArgumentById(id: 2)["value"] as! String

        if(action == "-request_login") {
        	print("======== request_login =======")
        	sdk.RequestLogin(param, done: { (status) in
                print(status.toJSONString())
                stop = true;
            })
        }

        if(action == "-confirm_login") {
        	print("======== confirm_login =======")
            let param2 = getArgumentById(id: 3)["value"] as! String
            // sdk.user?.auth = LoginData(param, group:current_role)
            sdk.ConfirmLogin(param2, done: { (status) in
                print(status.toJSONString());
                stop = true;
            })
        }

        while stop == false {
            
        }
        return;

    }
    
    func printUsage() {
        let executableName = CommandLine.arguments[0] as String

        print("usage:")
        print("================ SDK METHODS ===============")
        print("\(executableName) -request_login phone")
        print("\(executableName) -confirm_login phone code")
        print("============================================")
    }
    
    func getOption(_ option: String) -> (OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func getArgumentById(id:Int) -> [String:Any] {
        let argument = CommandLine.arguments[id]
        let start_index = argument.characters.index(argument.startIndex, offsetBy: 0)
        let (option, value) = getOption(argument.substring(from: start_index))
        let r = ["option":option, "value":value] as [String : Any]
        return r
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