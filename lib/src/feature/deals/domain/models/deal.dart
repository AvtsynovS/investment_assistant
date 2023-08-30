import 'package:freezed_annotation/freezed_annotation.dart';

// Указываем путь для автогенерации файла через Freezed
part 'deal.freezed.dart';

// Команда для автогенерации файла.
// watch - автоматически отслеживать изменения в файле и выполнять автогенерацию в случае изменения файла.
// --delete-conflicting-outputs - удаляет старые варианты автосгенерированных файлов

// flutter pub run build_runner watch --delete-conflicting-outputs

// Добавляем аннотацию для автогенерации файла через Freezed
@freezed
class Deal with _$Deal {
  const factory Deal({
  required int id,
  required String assetsTitle,
  required String assetsType,
  required double buy,
  required int quantity,
  @Default(false) bool status,
  String? createAt,
  String? finishDate,
  double? sell,
  double? proffit,
  String? proffitPersent,
  }) = _Deal;
}
