def flood_fill(img : Array(Array(Int32)), sr : Int32, sc : Int32, color : Int32)
  original = img[sr][sc]
  return if original == color
  queue = [{sr, sc}]
  img[sr][sc] = color
  until queue.empty?
    r, c = queue.shift
    { {1, 0}, {-1, 0}, {0, 1}, {0, -1}}.each do |(dr, dc)|
      nr, nc = r + dr, c + dc
      if nr >= 0 && nr < img.size && nc >= 0 && nc < img[0].size && img[nr][nc] == original
        img[nr][nc] = color
        queue << {nr, nc}
      end
    end
  end
end

image = [[1, 1, 0], [1, 0, 0], [1, 1, 1]]
flood_fill(image, 0, 0, 7)
image.each { |row| puts row.join(" ") }
