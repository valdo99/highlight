---
title: Canvas & WebGL
slug: canvas
createdAt: 2021-10-13T22:55:19.000Z
updatedAt: 2022-09-29T18:01:58.000Z
---
<br/>

<div style={{position: "relative", paddingBottom: "64.90384615384616%", height: 0 }}>
    <iframe src="https://www.loom.com/embed/ebb971bf5fdd4aaf9ae1924e7e536fb7" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen style={{position: "absolute", top: 0, left: 0, width: "100%", height: "100%"}}></iframe>
</div>
## Canvas Recording

Highlight can now not record the contents of `<canvas>` elements. This feature is disabled by default, but can be enabled and configured via the `H.init` options. You'll want to configure the recording settings depending on the type of HTML5 Canvas application you are building. For example, a video game WebGL application may require a higher snapshotting framerate to ensure the replay has enough frames to understand what was happening.

Enable canvas recording by configuring [H.init()](../../../sdk/client.md#Hinit) in the following way:

```javascript
H.init('<YOUR_PROJECT_ID>', {
  enableCanvasRecording: true,
  samplingStrategy: {
    canvas: 5,
    canvasMaxSnapshotDimension: 480,
  },
})
```

With these settings, the canvas is serialized as a 480p video at 5FPS.

`samplingStrategy.canvas` is the frame per second rate used to record the HTML canvas. A value < 5 is recommended to ensure the recording is not too large and does not have issues with playback.

`samplingStrategy.canvasFactor`: a resolution scaling factor applied to both dimensions of the canvas.

`samplingStrategy.canvasMaxSnapshotDimension`: max recording resolution of the largest dimension of the canvas.

```hint
[Privacy](../../../general/6_product-features/1_session-replay/privacy.md) controls do not apply to canvas recording at this time.
```

Enabling canvas recording should not have any impact on the performance your application. We've recently changed our uploading client to use browser web-workers to ensure that data serialization cannot block the rendering of your application. If you run into any issues please [let us know](https://highlight.io/community)!

## WebGL Recording

Highlight is able to record websites that use WebGL in the `<canvas>` element. 

To enable WebGL recording, enable canvas recording by following the steps above.

## Webcam Recording and Inlining Video Resources

If you use `src=blob:` `<video>` elements in your app (for example, you are using javascript to dynamically generate a video stream) or are streaming a webcam feed to a `<video>` element, you'll need to inline the `<video>` elements for them to appear correctly in the playback. Do this by enabling the `inlineImages` setting.

```javascript
H.init('<YOUR_PROJECT_ID>', {
  ..., 
  inlineImages: true,
})
```
