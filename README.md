# Virtual Arcade Bar
This project is to create a virtual arcade bar space and allow people to see it via a website.

See __[website here](http://virtualarcadebar.com)__.

### Development
The MVP of this project is a website that exists on the internet that I can share with people easily using a QR code.

See __[QA environment here](https://aallbrig.github.io/virtual-arcade-bar/)__.

```bash
# local dev
./scripts/website-up.sh
./scripts/website-test.sh
./scripts/website-down.sh

# load up infrastructure in AWS
./scripts/website-test.sh
./scripts/infrastructure-up.sh

# docker based building
./scripts/docker-image-build.sh
# build the current unity project, located by default in subfolders of ./unity directory.
./scripts/docker-unity-build.sh
```
