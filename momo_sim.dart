// Student: Gemimah Bizumuremyi
// Reg no: 25967
const String regNo = '25967';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. PIN tests
  print('--- PIN validation ---');
  print('12345: ${isValidPin('12345')}');    // false (banned)
  print('77777: ${isValidPin('77777')}');    // false (all same)
  print('4821: ${isValidPin('4821')}');      // false (4 chars)
  print('48a21: ${isValidPin('48a21')}');    // false (has letter)
  print('48217: ${isValidPin('48217')}');    // true (valid)

  // 2. Starting balance
  int balance = 20000 + t * 500;
  print('--- Starting balance: ${formatRwf(balance)} ---');

  // 3. Send three times
  print('--- Sending ${formatRwf((d + 1) * 3000)} three times ---');
  int i = 0;
  while (i < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);
    i++;
  }

  // 4. Buy 1000 airtime
  print('--- Buying airtime ---');
  balance = buyAirtime(balance, 1000);

  // 5. Send 0
  print('--- Send 0 ---');
  balance = sendMoney(balance, 0);

  // 6. Send 200000
  print('--- Send 200,000 ---');
  balance = sendMoney(balance, 200000);

  // 7. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 8. Extra tests
  print('--- Extra tests ---');
  print(formatRwf(1234567));    // 1,234,567 RWF
  print(formatRwf(100));        // 100 RWF
  print(formatRwf(-1));         // -1 RWF
  print(isValidPin('00000'));   // false (all same)
  print(isValidPin('54321'));   // true (valid, not banned)
  print(isValidPin('999999'));  // false (6 chars)
}

// by GB
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by GB
String formatRwf(int amount) {
  bool negative = amount < 0;
  int absAmount = amount.abs();
  String digits = absAmount.toString();
  String result = '';
  int count = 0;
  int i = digits.length - 1;
  while (i >= 0) {
    result = digits[i] + result;
    count++;
    if (count == 3 && i > 0) {
      result = ',' + result;
      count = 0;
    }
    i--;
  }
  if (negative) result = '-' + result;
  return result + ' RWF';
}

// by GB
bool isValidPin(String pin) {
  if (pin.length != 5) return false;

  int i = 0;
  while (i < pin.length) {
    String ch = pin[i];
    if (!(ch == '0' || ch == '1' || ch == '2' || ch == '3' ||
          ch == '4' || ch == '5' || ch == '6' || ch == '7' ||
          ch == '8' || ch == '9')) {
      return false;
    }
    i++;
  }

  if (pin == '12345') return false;

  bool allSame = true;
  int j = 1;
  while (j < pin.length) {
    if (pin[j] != pin[0]) {
      allSame = false;
      break;
    }
    j++;
  }
  if (allSame) return false;

  return true;
}

// by GB
int sendMoney(int balance, int amount) {
  int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by GB
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid airtime amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. New balance: ${formatRwf(newBalance)}');
  return newBalance;
}