Regexp.escape = function (str){
  return str.replace(/[\]{}()*+?.\\|^$\-,&#\s]/g, "\\$&");
};
//test
var str = "Hello.World?";
var escaped_str = Regexp.escape(str);
alert(escaped_str == "Hello\\.World\\?"); //-> true




