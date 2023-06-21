```
PUT _cluster/settings
{
  "persistent": {
    "compatibility": {
      "override_main_response_version": true
    }
  }
}
```