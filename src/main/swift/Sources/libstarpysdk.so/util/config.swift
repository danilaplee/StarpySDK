import Foundation;
import Dispatch;

enum sdkEnv {
	case dev
    case prod
    case test
    case local
}

class sdkConfig {
	var env:sdkEnv = .dev

	init(_ e:sdkEnv?) {
		if(e != nil) {
			env = e!;
		}
	}
}