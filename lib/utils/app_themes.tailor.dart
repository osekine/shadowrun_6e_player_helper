// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_themes.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppThemeTailorMixin on ThemeExtension<AppTheme> {
  Color get background;
  Color get backgroundLight;
  Color get backgroundDark;
  Color get text;
  Color get textMuted;
  Color get highlight;
  Color get border;
  Color get borderMuted;
  Color get primary;
  Color get secondary;
  Color get danger;
  Color get warning;
  Color get success;
  Color get info;
  TextStyle get header;
  TextStyle get headerSmall;
  TextStyle get body;
  TextStyle get description;

  @override
  AppTheme copyWith({
    Color? background,
    Color? backgroundLight,
    Color? backgroundDark,
    Color? text,
    Color? textMuted,
    Color? highlight,
    Color? border,
    Color? borderMuted,
    Color? primary,
    Color? secondary,
    Color? danger,
    Color? warning,
    Color? success,
    Color? info,
    TextStyle? header,
    TextStyle? headerSmall,
    TextStyle? body,
    TextStyle? description,
  }) {
    return AppTheme(
      background: background ?? this.background,
      backgroundLight: backgroundLight ?? this.backgroundLight,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      text: text ?? this.text,
      textMuted: textMuted ?? this.textMuted,
      highlight: highlight ?? this.highlight,
      border: border ?? this.border,
      borderMuted: borderMuted ?? this.borderMuted,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
      header: header ?? this.header,
      headerSmall: headerSmall ?? this.headerSmall,
      body: body ?? this.body,
      description: description ?? this.description,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) return this as AppTheme;
    return AppTheme(
      background: Color.lerp(background, other.background, t)!,
      backgroundLight: Color.lerp(backgroundLight, other.backgroundLight, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      text: Color.lerp(text, other.text, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      highlight: Color.lerp(highlight, other.highlight, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderMuted: Color.lerp(borderMuted, other.borderMuted, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      info: Color.lerp(info, other.info, t)!,
      header: TextStyle.lerp(header, other.header, t)!,
      headerSmall: TextStyle.lerp(headerSmall, other.headerSmall, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      description: TextStyle.lerp(description, other.description, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppTheme &&
            const DeepCollectionEquality().equals(
              background,
              other.background,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundLight,
              other.backgroundLight,
            ) &&
            const DeepCollectionEquality().equals(
              backgroundDark,
              other.backgroundDark,
            ) &&
            const DeepCollectionEquality().equals(text, other.text) &&
            const DeepCollectionEquality().equals(textMuted, other.textMuted) &&
            const DeepCollectionEquality().equals(highlight, other.highlight) &&
            const DeepCollectionEquality().equals(border, other.border) &&
            const DeepCollectionEquality().equals(
              borderMuted,
              other.borderMuted,
            ) &&
            const DeepCollectionEquality().equals(primary, other.primary) &&
            const DeepCollectionEquality().equals(secondary, other.secondary) &&
            const DeepCollectionEquality().equals(danger, other.danger) &&
            const DeepCollectionEquality().equals(warning, other.warning) &&
            const DeepCollectionEquality().equals(success, other.success) &&
            const DeepCollectionEquality().equals(info, other.info) &&
            const DeepCollectionEquality().equals(header, other.header) &&
            const DeepCollectionEquality().equals(
              headerSmall,
              other.headerSmall,
            ) &&
            const DeepCollectionEquality().equals(body, other.body) &&
            const DeepCollectionEquality().equals(
              description,
              other.description,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(background),
      const DeepCollectionEquality().hash(backgroundLight),
      const DeepCollectionEquality().hash(backgroundDark),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(textMuted),
      const DeepCollectionEquality().hash(highlight),
      const DeepCollectionEquality().hash(border),
      const DeepCollectionEquality().hash(borderMuted),
      const DeepCollectionEquality().hash(primary),
      const DeepCollectionEquality().hash(secondary),
      const DeepCollectionEquality().hash(danger),
      const DeepCollectionEquality().hash(warning),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(info),
      const DeepCollectionEquality().hash(header),
      const DeepCollectionEquality().hash(headerSmall),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(description),
    );
  }
}

extension AppThemeBuildContextProps on BuildContext {
  AppTheme get appTheme => Theme.of(this).extension<AppTheme>()!;
  Color get background => appTheme.background;
  Color get backgroundLight => appTheme.backgroundLight;
  Color get backgroundDark => appTheme.backgroundDark;
  Color get text => appTheme.text;
  Color get textMuted => appTheme.textMuted;
  Color get highlight => appTheme.highlight;
  Color get border => appTheme.border;
  Color get borderMuted => appTheme.borderMuted;
  Color get primary => appTheme.primary;
  Color get secondary => appTheme.secondary;
  Color get danger => appTheme.danger;
  Color get warning => appTheme.warning;
  Color get success => appTheme.success;
  Color get info => appTheme.info;
  TextStyle get header => appTheme.header;
  TextStyle get headerSmall => appTheme.headerSmall;
  TextStyle get body => appTheme.body;
  TextStyle get description => appTheme.description;
}
