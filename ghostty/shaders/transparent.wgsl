// transparent.wgsl
@group(0) @binding(0) var<uniform> opacity: f32;
@group(0) @binding(1) var tex: texture_2d<f32>;
@group(0) @binding(2) var smp: sampler;

@fragment
fn main(@location(0) fragCoord: vec2<f32>) -> @location(0) vec4<f32> {
    let color = textureSample(tex, smp, fragCoord);
    return vec4(color.rgb, color.a * opacity); // opacity control
