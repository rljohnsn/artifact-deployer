## Release

artifact-deployer uses [stove](http://sethvargo.github.io/stove/) to release/tag artifacts on [Supermarket](https://supermarket.chef.io/cookbooks/artifact-deployer)

### Configuring Supermarket login

Assuming you have a username and key from Supermarket account subscription (if not, [create an account](https://manage.chef.io/signup?ref=community)), you must type, only once
```
stove login --username maoo --key ~/.ssh/supermarket-maoo.pem
```

### Releasing the current version

```
stove
```

Versions are manually handled (bumped) in metadata.rb; if you try to release an existing version, you will get an error from github when trying to create the tag (tag already exist)
