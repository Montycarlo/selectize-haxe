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
of creating a mapping of `X -> SelectizeOption`, to make things a bit more palatable and cleaner.

### Samples
+ [Simple List](./samples/01-simple-list/Webapp.hx)


### Dependencies  
+ [haxe-react](https://github.com/massiveinteractive/haxe-react)    
```bash
haxelib install react
```
+ [reactjs](https://facebook.github.io/react/)
+ [Selectize Dependencies](https://github.com/selectize/selectize.js#dependencies)

[Selectize.js homepage](http://selectize.github.io/selectize.js/)
