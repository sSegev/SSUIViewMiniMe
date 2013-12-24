SSUIViewMiniMe
==============

A miniature replica of your UIView with an indicator of your location.

<p align="center">
  <img src="https://f.cloud.github.com/assets/3911009/1750211/28086d6a-657b-11e3-9b9b-352c350ea7a3.gif">
</p>

Overview
--------
SSUIViewMiniMe takes your UIView and creates a small version of it with an indicator of your location on the original UIView.

The example shown in the GIF above is in the `SSUIViewMiniMeDemo/` directory:

Features
--------
- The MiniMe UIView is responsive to touch. Dragging your finger on it will move the actual UIScrollView
- The MiniMe UIView indicator will track the current movment in the UIScrollView
- The MiniMe UIView will draw on it self any changes made in the UIScrollView

All those features are shown in the GIF above (might take a few seconds to load)

Requirements
------------
- iOS 5+ (Should work on 4 if you are not using a StoryBoard, not tested)

Screenshot (The GIF above will explain a lot more)
-----------
<p align="center">
<img src="https://f.cloud.github.com/assets/3911009/1750212/280acf4c-657b-11e3-9efb-b9ec8ce3f113.png">
</p>

Why?
---
In one of my projects I was asked to create a simple UI for seats selection in a movie theater. 
With the iPhone screen relatively small I had to find a way to zoom in on a view and still let the user know about his 
current location. I ended up using something much simpler for the seat selection project and found a lot of other uses for SSUIViewMiniMe class.

Installation With CocoaPods
---------------------------

Edit your Podfile and add `SSUIViewMiniMe`:

``` bash
pod 'SSUIViewMiniMe'
```

Manual Installation
------------------

Just drag SSUIViewMiniMe.h & m to your project.

How to use
----------
import SSUIViewMiniMe.h to your project.

```Objective-C

miniMeView = [[SSUIViewMiniMe alloc]initWithView:yourView withRatio:4]; // ratio is the size of the miniMe view you want to create. UIView size \ ratio = UIViewMiniMe size
[self.view addSubview:miniMeView];
```
That's it!

If you want to use the delegate methods (optional) you will also need to add
```Objective-C
@interface ViewController () <SSUIViewMiniMeDelegate>
...
miniMeView.delegate = self;
```

SSUIViewMiniMeDelegate Protocols
-

```Objective-C
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView willBeginDragging:(UIScrollView *)scrollView;
```
Tells the delegate when scrolling is about to start.

-

```Objective-C
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView didScroll:(UIScrollView *)scrollView;
```
Tells the delegate when the user scrolls the content view.

-

```Objective-C
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView didEndDragging:(UIScrollView *)scrollView;
```
Tells the delegate when dragging ended.


-

```Objective-C
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView willBeginDecelerating:(UIScrollView *)scrollView;
```

Tells the delegate that scrolling movement is starting to decelerate.

-

```Objective-C
- (void)enlargedView:(SSUIViewMiniMe *)enlargedView didEndDecelerating:(UIScrollView *)scrollView;
```
Tells the delegate that the scroll view has ended decelerating the scrolling movement.


ToDo:
-----
1. Rotation
2. Other stuff

The MIT License (MIT)

Copyright (c) sSegev

