# rails_secrets_from_s3-cookbook

TODO: Enter the cookbook description here.

## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['rails_secrets_from_s3']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### rails_secrets_from_s3::default

Include `rails_secrets_from_s3` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[rails_secrets_from_s3::default]"
  ]
}
```

## License and Authors

Author:: kjoyner (<kjoyner>)
