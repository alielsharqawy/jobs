import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.focusNode,
    this.textInputAction,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.style,
    this.hintStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: labelStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
          ),
          SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          validator: validator,
          onChanged: onChanged,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          focusNode: focusNode,
          textInputAction: textInputAction,
          style: style ??
              TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: filled,
            fillColor: fillColor ?? Colors.grey[50],
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

class _PasswordField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const _PasswordField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  State<_PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<_PasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      controller: widget.controller,
      obscureText: _isObscured,
      prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[600]),
      suffixIcon: IconButton(
        icon: Icon(
          _isObscured ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey[600],
        ),
        onPressed: () => setState(() => _isObscured = !_isObscured),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}

// Factory constructors for common use cases
extension CustomTextFormFieldFactories on CustomTextFormField {
  // Email field
  static CustomTextFormField email({
    Key? key,
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      labelText: labelText ?? 'Email',
      hintText: hintText ?? 'Enter your email',
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
      onChanged: onChanged,
    );
  }

  // Password field
  static Widget password({
    Key? key,
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return _PasswordField(
      key: key,
      labelText: labelText ?? 'Password',
      hintText: hintText ?? 'Enter your password',
      controller: controller,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
      onChanged: onChanged,
    );
  }

  // Phone field
  static CustomTextFormField phone({
    Key? key,
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      labelText: labelText ?? 'Phone Number',
      hintText: hintText ?? 'Enter your phone number',
      controller: controller,
      keyboardType: TextInputType.phone,
      prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey[600]),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            }
            if (value.length < 10) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
      onChanged: onChanged,
    );
  }

  // Name field
  static CustomTextFormField name({
    Key? key,
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      labelText: labelText ?? 'Full Name',
      hintText: hintText ?? 'Enter your full name',
      controller: controller,
      keyboardType: TextInputType.name,
      prefixIcon: Icon(Icons.person_outline, color: Colors.grey[600]),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            if (value.trim().length < 2) {
              return 'Name must be at least 2 characters';
            }
            return null;
          },
      onChanged: onChanged,
    );
  }

  // Multiline text field
  static CustomTextFormField multiline({
    Key? key,
    String? labelText,
    String? hintText,
    TextEditingController? controller,
    int maxLines = 4,
    int? maxLength,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return CustomTextFormField(
      key: key,
      labelText: labelText ?? 'Description',
      hintText: hintText ?? 'Enter description...',
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
