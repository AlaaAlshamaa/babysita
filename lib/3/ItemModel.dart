import 'dart:convert';

class Item {
  String title;
  double price;
  Item({
    required this.title,
    required this.price,
  });

  Item copyWith({
    String? title,
    double? price,
  }) {
    return Item(
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'price': price});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() => 'Item(title: $title, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && other.title == title && other.price == price;
  }

  @override
  int get hashCode => title.hashCode ^ price.hashCode;
}
