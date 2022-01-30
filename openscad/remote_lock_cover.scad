fn = 128;
length = 150;
width=70;
height=1;

module render() {
  cube(size = [length, width, height]);
  rotate(a=80, v=[1,0,0]) {
    cube(size = [length, width, height]);
  }
}

echo(version=version());

render();
