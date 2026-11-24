import 'package:eco/feature/search/widgets/last_search.dart';
import 'package:eco/feature/search/widgets/search.dart';
import 'package:eco/feature/search/widgets/search_result.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: SearchBarText(
                      controller: _controller,
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/icons/Buy.png', width: 28, height: 28),
                ],
              ),

              const SizedBox(height: 2),

              if (_controller.text.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: LastSearchSection(),
                )
              else
                Expanded(child: SearchResult(
                  searchQuery: _controller.text,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
