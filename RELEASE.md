## Release

artifact-deployer uses [stove](http://sethvargo.github.io/stove/) to release and tag artifacts and Supermarket to store binaries.

### Configuring Supermarket login

Assuming you have a username and key from Supermarket account subscription (if not, [create an account](https://manage.chef.io/signup?ref=community)), you must type, only once
```
stove login --username maoo --key ~/.ssh/supermarket-maoo.pem
```

### Releasing the current version

```
rake publish
```

Versions are manually handled in metadata.rb
