import PNG

/// https://commons.wikimedia.org/wiki/File:Coat_of_arms_of_Siam.svg
let path:String = "Snippets/ImageMetadata/example"

guard
var image:PNG.Data.Rectangular = try .decompress(path: "\(path).png")
else
{
    fatalError("failed to open file '\(path).png'")
}

if  let time:PNG.TimeModified = image.metadata.time
{
    print(time)
}
if  let gamma:PNG.Gamma = image.metadata.gamma
{
    print(gamma)
}
if  let physicalDimensions:PNG.PhysicalDimensions = image.metadata.physicalDimensions
{
    print(physicalDimensions)
}

//print(image.metadata)

image.metadata.time = .init(year: 1992, month: 8, day: 3, hour: 0, minute: 0, second: 0)

try image.compress(path: "\(path)-newtime.png")


if  let image:PNG.Data.Rectangular = try .decompress(path: "\(path)-newtime.png"),
    let time:PNG.TimeModified = image.metadata.time ?? nil
{
    print(time)
}
