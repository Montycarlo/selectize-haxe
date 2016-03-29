package epidev;

import api.react.ReactComponent.ReactComponentOfPropsAndState;
import api.react.ReactMacro.jsx;
import jQuery.*;
using Lambda;


interface ISelectizeOption{
	function selectize():SelectizeOption;
}

class SelectizeOption implements ISelectizeOption{
	public var name:String;
	public var val:String;
	public function new(n:String, v:String){
		this.name = n;
		this.val = v;
	}
	public function selectize() return this;
}

typedef SelectizeProps = {
	var ops:Array<ISelectizeOption>;
	@optional var create:Bool;
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
		var ops = props.ops.map(function(x) return x.selectize());
		return [for(o in ops) jsx('<option key={o.val} value={o.val}>{o.name}</option>')];
	}

	override public function componentDidMount(){
		untyped new JQuery("#sel").selectize({create:props.create});
	}

}
