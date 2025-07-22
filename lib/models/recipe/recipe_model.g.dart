// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      id: json['id'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      title: json['title'] as String? ?? "",
      image: json['image'] as String? ?? "",
      time: json['time'] as String? ?? "",
      calories: json['calories'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      backgroundColor: json['backgroundColor'] as String? ?? "",
      description: json['description'] as String? ?? "",
      category: json['category'] as String? ?? "",
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      steps:
          (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'image': instance.image,
      'time': instance.time,
      'calories': instance.calories,
      'rating': instance.rating,
      'backgroundColor': instance.backgroundColor,
      'description': instance.description,
      'category': instance.category,
      'reviews': instance.reviews,
      'steps': instance.steps,
      'ingredients': instance.ingredients,
    };
