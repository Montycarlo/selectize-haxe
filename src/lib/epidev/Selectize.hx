package epidev;

import api.react.ReactComponent.ReactComponentOfPropsAndState;
import api.react.ReactMacro.jsx;
import jQuery.*;

class SelectizeOption{
	public var name:String;
	public var val:String;
	public function new(n:String, v:String){
		this.name = n;
		this.val = v;
	}
}

typedef SelectizeProps = {
	ops:Array<SelectizeOption>,
};
typedef SelectizeState = {};

@final
class Selectize extends ReactComponentOfPropsAndState<SelectizeProps, SelectizeState>{

	override public function render(){
		return jsx('
		<select id="sel">
			${createChildren()}
		</select>
		');
	}

	private function createChildren(){
		return [for(o in props.ops) jsx('<option key={o.val} value={o.val}>{o.name}</option>')];
	}

	override public function componentDidMount(){
		untyped new JQuery("#sel").selectize({create:true});
	}

}
