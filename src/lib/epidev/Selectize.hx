package epidev;

import api.react.ReactComponent.ReactComponentOfPropsAndState;
import api.react.ReactMacro.jsx;
import jQuery.*;
using Lambda;


interface ISelectizeOption{
	/*
	Interface for converting an object to a selectize option.
	Classes which implement this should return a newly-constructed SelectizeOption,
	 	public function selectize() return new SelectizeOption(this.name, this.value);
	which will represent the object in the Selectize box.
	*/
	function selectize():SelectizeOption;
}

@final
class SelectizeOption implements ISelectizeOption{
	/*
	A object which represents an option in a Selectize box.
	Just contains a name and value field, which will be substituted in the HTML <option> tag.
	*/
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
	@optional var startEmpty:Bool;
	@optional var create:Bool;
	@optional var placeholder:String;
	@optional var label:String;
};
typedef SelectizeState = {};

@final
class Selectize extends ReactComponentOfPropsAndState<SelectizeProps, SelectizeState>{
	/*
	Main class for this package. Responsible for interfacing with React and the actual selectize.js calls.
	Setting the properties is done via a parent object's JSX render() method.

			jsx('<Selectize ops=${getOps()}')

	There's a number of configurable properties, many of which are optional. Check the SelectizeProps typedef,
	or the samples directory to check for appropriate usage or copypasta.	
	*/

	override public function render(){
		var label = props.label != null ? jsx('<label className="control-label">${props.label}</label>') : null;
		return jsx('
		<div>
			${label}
			<select id="sel" placeholder=${props.placeholder} defaultValue="">
				${createChildren()}
			</select>
		</div>
		');
	}

	private function createChildren(){
		var ops = props.ops.map(function(x) return x.selectize());
		if(props.startEmpty == true || props.placeholder != null) 
			ops.unshift(new SelectizeOption('',''));

		return [
			for(o in ops) 
				jsx('<option key=${o.val} value=${o.val}>${o.name}</option>')
		];
	}

	override public function componentDidMount(){
		/* TODO: Fix this up, untyped should be eliminated as the JQuery lib should be present and
		 the selectize extern should be created. #sel should also be patched.*/
		untyped new JQuery("#sel").selectize({
			create:props.create
		});
	}

}
