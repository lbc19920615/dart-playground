Future<String> fetchUserOrder() {
  // Imagine that this function is more complex and slow
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

Future<String> createOrderMessage() async {
  var order = '';
  try {
    order = await fetchUserOrder();
    return 'Your order is: $order';
  } catch (e) {
    throw e;
  }
}

void main() {
  // createOrderMessage().then((value) => {print(value)});

  Stream.fromFutures([createOrderMessage()]).listen((data) {
    print(data);
  }, onError: (e) {}, onDone: () {});
}
