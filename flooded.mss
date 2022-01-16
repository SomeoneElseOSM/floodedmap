#flooded_area {
  [zoom >= 13] {
    polygon-fill: #b5d0d0;
    line-color: #0080ff;
    line-width: 1;
    line-opacity: 0.329;
    [zoom >= 16] { line-width: 1.5; }
    [zoom >= 18] { line-width: 2; }
    [zoom >= 20] { line-width: 2.5; }
  }
}

#flooded_line {
  [zoom >= 13] {
    line-color: #0080ff;
    line-width: 4;
    [zoom >= 16] { line-width: 6; }
    [zoom >= 18] { line-width: 8; }
    [zoom >= 20] { line-width: 10; }
  }
}

