// Student: Gemimah Bizumuremyi
// Reg no: 25967
const String regNo = '25967';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String myName = 'Gemimah Bizumuremyi';
  int vowelCount = countVowels(myName);
  print('$myName has $vowelCount vowels');

  // B3
  print(initials('Gemimah Bizumuremyi'));
  print(initials('ana uwase'));
  print(initials(''));

  // C5
  print('--- triangle height ${d + 3} ---');
  drawTriangle(d + 3);
  print('--- triangle height 0 ---');
  drawTriangle(0);
  print('--- triangle height -2 ---');
  drawTriangle(-2);

  // D2
  print('--- MoMo receipts ---');
  String phone = '0788123456';
  String masked = maskPhone(phone);
  int i = 1;
  int totalFees = 0;
  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);
    print('Receipt $i | $amount RWF | fee $fee RWF | to $masked');
    totalFees += fee;
    i++;
  }
  print('Total fees: $totalFees RWF');
}

// PART B2
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

// PART B3 
// by GB
String initials(String fullName) {
  String trimmed = fullName.trim();
  if (trimmed.isEmpty) return '';

  List<String> words = trimmed.split(RegExp(r'\s+'));
  String result = '';
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      result += word[0].toUpperCase() + '.';
    }
  }
  return result;
}

// PART C5 
// by GB
void drawTriangle(int height) {
  if (height <= 0) return;
  int i = 1;
  while (i <= height) {
    String spaces = '';
    int s = 0;
    while (s < height - i) {
      spaces += ' ';
      s++;
    }
    String symbol = (i % 2 == 1) ? '*' : '#';
    String row = '';
    int k = 0;
    while (k < i) {
      row += symbol;
      k++;
    }
    print(spaces + row);
    i++;
  }
}

// PART D2
// by GB
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by GB
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  String first = phone.substring(0, 3);
  String last = phone.substring(phone.length - 2);
  String stars = '';
  int i = 0;
  while (i < phone.length - 5) {
    stars += '*';
    i++;
  }
  return first + stars + last;
}