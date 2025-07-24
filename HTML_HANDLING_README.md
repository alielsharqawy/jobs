# معالجة محتوى HTML في تطبيق الوظائف

## المشكلة
حقل `jobDescription` يحتوي على HTML tags مثل:
```html
<p>هذا وصف الوظيفة مع <strong>نص غامق</strong> و <em>نص مائل</em></p>
<ul>
<li>متطلب أول</li>
<li>متطلب ثاني</li>
</ul>
```

## الحلول المُطبقة

### 1. تحويل HTML إلى نص عادي (مُطبق حالياً)
**الملف**: `lib/core/utils/html_helper.dart`

**الطرق المتاحة**:
- `HtmlHelper.htmlToPlainText()` - يستخدم مكتبة html لتحويل دقيق
- `HtmlHelper.stripHtmlTags()` - يستخدم regex لإزالة سريعة للـ tags

**الاستخدام في JobListItem**:
```dart
Text(
  HtmlHelper.htmlToPlainText(job.jobDescription ?? 'بدون وصف'),
  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
  maxLines: 3,
  overflow: TextOverflow.ellipsis,
)
```

### 2. عرض HTML مع التنسيق (اختياري)
إذا كنت تريد عرض HTML مع الاحتفاظ بالتنسيق، يمكنك:

#### الطريقة الأولى: استخدام flutter_html
```yaml
dependencies:
  flutter_html: ^3.0.0-beta.2
```

```dart
import 'package:flutter_html/flutter_html.dart';

Html(
  data: job.jobDescription ?? 'بدون وصف',
  style: {
    "body": Style(fontSize: FontSize(14), color: Colors.grey.shade700),
    "p": Style(margin: EdgeInsets.zero),
  },
)
```

#### الطريقة الثانية: استخدام flutter_widget_from_html
```yaml
dependencies:
  flutter_widget_from_html: ^0.10.5
```

```dart
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

HtmlWidget(
  job.jobDescription ?? 'بدون وصف',
  textStyle: TextStyle(fontSize: 14, color: Colors.grey.shade700),
)
```

## التطبيق الحالي
- **يستخدم**: `HtmlHelper.htmlToPlainText()`
- **النتيجة**: نص عادي بدون HTML tags
- **المزايا**: سريع، لا يحتاج مكتبات إضافية كثيرة
- **العيوب**: يفقد التنسيق (غامق، مائل، قوائم)

## التغيير للعرض المُنسق
إذا كنت تريد عرض HTML مع التنسيق:

1. أضف مكتبة HTML rendering في `pubspec.yaml`
2. استبدل `Text` widget بـ `Html` أو `HtmlWidget`
3. استخدم `JobListItemWithHtml` كمرجع

## المكتبات المُضافة حالياً
- `html: ^0.15.4` - لتحويل HTML إلى نص عادي

## الاستخدام
```dart
// في home_jop_view.dart
JobListItem(
  job: job,
  onApplyPressed: () => _showApplyDialog(context, job.jobTitleAlias ?? 'الوظيفة'),
)
```

النص الآن سيظهر نظيفاً بدون HTML tags! 🎉
