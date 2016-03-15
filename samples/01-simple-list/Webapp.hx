package;

import api.react.ReactComponent;
import api.react.ReactMacro.jsx;
import api.react.ReactDOM;
import js.Browser;

import epidev.Selectize;
import epidev.Selectize.SelectizeOption;

class Webapp extends ReactComponent{

  static public function main() 
    ReactDOM.render(jsx('<$Webapp/>'), Browser.document.getElementById('app'));

  override public function render(){
    var op = function(x,y) return new SelectizeOption(x,y);
    var ops = [
				op("Jonny", "john"),
				op("Emma", "emma"),
				op("Eddie", "eddie"),
				op("Joel", "joel"),
				op("Keith", "keith")
		];
    return jsx('<$Selectize ops=$ops/>');
  }
}

