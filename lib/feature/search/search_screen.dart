import 'package:eco/core/theme/app_image.dart';
import 'package:eco/core/widgets/app_search_field.dart';
import 'package:eco/feature/search/widgets/last_search.dart';
import 'package:eco/feature/search/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final List<String> _lastSearches = [
    'Iphone 12 pro max',
    'Camera fujifilm',
    'Tripod Mini',
    'Bluetooth speaker',
    'Drawing pad',
  ];

  String _query = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    setState(() => _query = _controller.text.trim());
  }

  void _selectSuggestion(String value) {
    _controller.text = value;
  }

  void _removeSuggestion(String value) {
    setState(() => _lastSearches.remove(value));
  }

  void _clearSuggestions() {
    setState(_lastSearches.clear);
  }

  @override
  void dispose() {
    _controller.removeListener(_onQueryChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: AppSearchField(
                      controller: _controller,
                      autofocus: true,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(AppImage.cart, width: 28.r, height: 28.r),
                ],
              ),
              SizedBox(height: 2.h),
              if (_query.isEmpty)
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: LastSearchSection(
                    items: _lastSearches,
                    onSelected: _selectSuggestion,
                    onRemoved: _removeSuggestion,
                    onCleared: _clearSuggestions,
                  ),
                )
              else
                Expanded(child: SearchResult(searchQuery: _query)),
            ],
          ),
        ),
      ),
    );
  }
}
