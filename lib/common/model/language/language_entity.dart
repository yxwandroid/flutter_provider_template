import '../http/entity_factory.dart';

class LanguageEntity extends BaseEntity {
  String name;
  String languageCode;
  String countryCode;
  bool selected =false;
//  Language(this.name, this.languageCode, this.countryCode);

  LanguageEntity(this.name, this.languageCode, this.countryCode, this.selected);

  @override
  String toString() {
    return 'LanguageEntity{name: $name, languageCode: $languageCode, countryCode: $countryCode, selected: $selected}';
  }


}
