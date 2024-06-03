class Product {
  final int id;
  final String name;
  final String slug;
  final String dateCreatedGmt;
  final String dateModifiedGmt;
  final String price;
  final String regularPrice;
  final String avgRating;
  final String ratingCount;
  final List<ProductImage> images;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.dateCreatedGmt,
    required this.dateModifiedGmt,
    required this.price,
    required this.regularPrice,
    required this.avgRating,
    required this.ratingCount,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      dateCreatedGmt: json['date_created_gmt'] as String? ?? '',
      dateModifiedGmt: json['date_modified_gmt'] as String? ?? '',
      price: json['price'] as String? ?? "0.0",
      regularPrice: json['regular_price'] as String? ?? "0.0",
      avgRating: json['average_rating'] as String? ?? "0.0",
      ratingCount: json['rating_count'].toString() as String? ?? "0",
      images: List<ProductImage>.from(json['images'].map((x) => ProductImage.fromJson(x))),
    );
  }
}

class ProductImage {
  final int id;
  final String src;
  final String name;
  final String alt;
  final String dateCreatedGmt;
  final String dateModifiedGmt;

  ProductImage({
    required this.id,
    required this.src,
    required this.name,
    required this.alt,
    required this.dateCreatedGmt,
    required this.dateModifiedGmt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      src: json['src'] ?? '',
      name: json['name'] ?? '',
      alt: json['alt'] ?? '',
      dateCreatedGmt: json['date_created_gmt'] ?? '',
      dateModifiedGmt: json['date_modified_gmt'] ?? '',
    );
  }
}
