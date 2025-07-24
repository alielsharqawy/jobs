# الوصول إلى tenantFilePath في تطبيق الوظائف

## 📋 نظرة عامة
`tenantFilePath` هو المسار الكامل للوجو الخاص بالشركة/المؤسسة ويمكن الوصول إليه من خلال `LogoModel`.

## 🏗️ بنية النظام

### 1. النموذج (Model)
```dart
class LogoModel {
  LogoModelResult? result;
  // ... باقي الخصائص
}

class LogoModelResult {
  String? tenantLogoPath;    // مسار مجلد اللوجو
  String? tenantFilePath;    // المسار الكامل للصورة ← هذا ما نريده!
  // ... باقي الخصائص
}
```

### 2. طبقة البيانات (Data Layer)
- **API Endpoint**: `https://api.tenxerp.com/api/api/services/app/Vacancies/GetTenantlogo?tenancyName=compassint`
- **Data Source**: `GetAllJobDataSourceImpl.getLogo()`
- **Repository**: `GetAllJobsRepoImpl.getLogo()`

### 3. طبقة المنطق (Domain Layer)
- **Use Case**: `GetLogoUC.call()`

### 4. طبقة العرض (Presentation Layer)
- **Cubit**: `GetLogoCubit` مع حالات: Loading, Loaded, Error
- **States**: `GetLogoLoaded` يحتوي على `LogoModel`

## 🔧 طرق الوصول إلى tenantFilePath

### الطريقة الأولى: في HomeAppBar (مُطبقة حالياً)
```dart
BlocBuilder<GetLogoCubit, GetLogoState>(
  builder: (context, state) {
    if (state is GetLogoLoaded) {
      final logoPath = state.logo.result?.tenantFilePath;
      
      if (logoPath != null && logoPath.isNotEmpty) {
        return Image.network(logoPath);
      }
    }
    return Icon(Icons.business);
  },
)
```

### الطريقة الثانية: باستخدام BlocListener
```dart
BlocListener<GetLogoCubit, GetLogoState>(
  listener: (context, state) {
    if (state is GetLogoLoaded) {
      final logoPath = state.logo.result?.tenantFilePath;
      print('Logo Path: $logoPath');
      // استخدم المسار هنا كما تشاء
    }
  },
  child: YourWidget(),
)
```

### الطريقة الثالثة: استخدام Widget منفصل
```dart
// في أي صفحة تريد عرض اللوجو
BlocProvider(
  create: (context) => getit<GetLogoCubit>()..getLogo(),
  child: LogoWidget(), // انظر: logo_widget.dart
)
```

## 📱 الاستخدامات العملية

### 1. عرض اللوجو في AppBar (مُطبق)
- الملف: `lib/feature/home/presentation/widgets/home_app_bar.dart`
- يعرض اللوجو في أعلى الشاشة

### 2. عرض اللوجو في أي مكان
```dart
// أضف في أي widget
LogoWidget() // يعرض اللوجو تلقائياً
```

### 3. الحصول على معلومات اللوجو كاملة
```dart
LogoInfoCard() // يعرض جميع معلومات اللوجو
```

## 🔍 تتبع العمليات (Debugging)

### Print Statements المُضافة:
```
🚀 GetLogoCubit: Logo cubit initialized successfully!
🔄 GetLogoCubit: Starting to fetch logo...
📡 GetLogoCubit: Calling API for logo...
✅ GetLogoCubit: Successfully received logo data
🖼️ GetLogoCubit: tenantLogoPath: [المسار]
📁 GetLogoCubit: tenantFilePath: [المسار الكامل] ← هذا ما نحتاجه!
🎉 GetLogoCubit: Logo data emitted successfully!
```

### في حالة الأخطاء:
```
❌ GetLogoCubit: Error occurred while fetching logo
🔴 GetLogoCubit: Error details: [تفاصيل الخطأ]
```

## 📂 الملفات ذات الصلة

### Core Files:
- `lib/feature/home/data/models/logo_model.dart` - نموذج البيانات
- `lib/feature/home/presentation/logic/get_logo/get_logo_cubit.dart` - منطق الحالة
- `lib/feature/home/presentation/logic/get_logo/get_logo_state.dart` - حالات النظام

### UI Files:
- `lib/feature/home/presentation/widgets/home_app_bar.dart` - عرض اللوجو في AppBar
- `lib/feature/home/presentation/widgets/logo_widget.dart` - widget مستقل للوجو
- `lib/feature/home/presentation/widgets/logo_access_examples.dart` - أمثلة متقدمة

### Service Locator:
- `lib/core/di/service_locator.dart` - تسجيل GetLogoCubit

## 🚀 الاستخدام السريع

### 1. في أي صفحة جديدة:
```dart
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحتي'),
        actions: [
          LogoWidget(), // اللوجو سيظهر تلقائياً
        ],
      ),
      body: Column(
        children: [
          LogoInfoCard(), // معلومات اللوجو كاملة
          // باقي المحتوى...
        ],
      ),
    );
  }
}
```

### 2. للحصول على المسار فقط:
```dart
BlocBuilder<GetLogoCubit, GetLogoState>(
  builder: (context, state) {
    if (state is GetLogoLoaded) {
      String? logoPath = state.logo.result?.tenantFilePath;
      // استخدم logoPath هنا
    }
    return Container();
  },
)
```

## ✅ الحالة الحالية
- ✅ API متصل ويعمل
- ✅ اللوجو يظهر في HomeAppBar
- ✅ Print statements مُضافة للتتبع
- ✅ معالجة الأخطاء موجودة
- ✅ أمثلة شاملة متوفرة

الآن يمكنك الوصول إلى `tenantFilePath` من أي مكان في التطبيق! 🎉
