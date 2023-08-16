/*
class _TasksState extends State {
  List colors = [Colors.blue, Colors.green, Colors.red, Colors.black];
  int level = 0;
  int maestry = 1;
  double progress = 0.0;

void levelUp() {
  if (level < 999) level++; 
    setState(() {
      progress = (level / (widget.dificuldade * maestry)) / 10;
      if (progress >= 1.0 && maestry < (colors.length)) {
        maestry++;
        level = 0;
        progress = 0; 
      }
    });
}
*/