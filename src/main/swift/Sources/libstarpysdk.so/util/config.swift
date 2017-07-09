import Foundation;
import Dispatch;

public enum StarpySDKEnv {
	case dev
    case prod
    case test
    case local
}

class sdkConfig {
	var env:StarpySDKEnv = .dev

	init(_ e:StarpySDKEnv?) {
		if(e != nil) {
			env = e!;
		}
	}
}