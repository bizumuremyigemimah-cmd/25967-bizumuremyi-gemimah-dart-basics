// Student: Gemimah Bizumuremyi
// Reg no: 25967
const String regNo = '25967';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  String myName = 'Gemimah Bizumuremyi';
  int vowelCount = countVowels(myName);
  print('$myName has $vowelCount vowels');
}

// by GB
int countVowels(String text) {
  String lower = text.toLowerCase();
  int count = 0;
  for (int i = 0; i < lower.length; i++) {
    String ch = lower[i];
    if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
      count++;
    }
  }
  return count;
}