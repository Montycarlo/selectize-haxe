# Selectize-haxe
A Haxe wrapper for Selectize.js using React which leverages Haxe's type system and some small helper functions.

### Basic Usage  
```haxe
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
```
Classes which implement the ISelectizeOption interface can be directly passed into the `ops` list, instead
of creating a mapping of `X -> SelectizeOption`, to make things a bit more palatable and cleaner in rendering;
```haxe
class Person implements ISelectizeOption{
	private var name:String;
	private var surname:String;
	private var id:Int;

	public function new(a:String,b:String, id:Int){
		name = a;
		surname = b;
		this.id = id;
	}

	public function selectize():SelectizeOption{
		return new SelectizeOption('$name $surname', '${this.id}');
	}
	
}
class Webapp extends ReactComponent{

  static public function main() 
    ReactDOM.render(jsx('<$Webapp/>'), Browser.document.getElementById('app'));

	private function getPeeps():List<Person>{
		return [
        new Person("Jonny", "john", 1),
        new Person("Emma", "emma", 2),
        new Person("Eddie", "eddie", 3),
        new Person("Joel", "joel", 4),
        new Person("Keith", "keith", 5)
		];
	}

  override public function render(){
    return jsx('<$Selectize ops=${getPeeps()}/>');
  }
}
```

### Samples
+ [Simple List](./samples/01-simple-list/Webapp.hx)


### Dependencies  
+ [haxe-react](https://github.com/massiveinteractive/haxe-react)    
+ [react.js](https://facebook.github.io/react/)
+ [Selectize.js dependencies](https://github.com/selectize/selectize.js#dependencies)

[Selectize.js homepage](http://selectize.github.io/selectize.js/)
