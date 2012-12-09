import 'dart:html';
import 'dart:isolate';
import 'dart:math';

void main() {
  new TrigramAnim(query("#TrigramAnim"));
}

class TrigramAnim {
  static const List<String> letters = const ["☱", "☲", "☳", "☴", "☵", "☶", "☷"];
  static const String theLetter = "☰";
  
  DivElement logo;
  SpanElement centerSpan;
  
  Timer timer;
  bool isOver = false;
  
  TrigramAnim(this.logo) {
    centerSpan = logo.query(".center span");
    timer = new Timer.repeating(500, (t) => randomLetter());
    logo.on.mouseOver.add((e) => isOver = true);
    logo.on.mouseOut.add((e) => isOver = false);
  }
  
  Random _rand = new Random(new Date.now().millisecond);
  randomLetter() {
    int i = isOver && letterContent == theLetter ? -1 : _rand.nextInt(letters.length + (isOver ? 4 : 1));
    letterContent = i >= 0 && i < letters.length ? letters[i] : theLetter;
  }
  
  get letterContent => centerSpan.innerHtml;
  set letterContent(String value) => centerSpan.innerHtml = value;
}
