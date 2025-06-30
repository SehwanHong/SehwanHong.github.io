module Jekyll
  # 페이지 한 장씩 생성
  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(base, '_layouts'), 'tag.html')
      # 템플릿에서 사용할 변수
      data['tag']   = tag
      data['title'] = "&#x201C;#{tag}&#x201D; 태그 글"
    end
  end

  # 태그 모음 추출 헬퍼
  module TagHelper
    def self.collect_all_tags(site)
      tag_map = Hash.new { |h, k| h[k] = [] }

      site.collections.each_value do |collection|
        collection.docs.each do |doc|
          tags = Array(doc.data['tags'])
          tags.each { |t| tag_map[t] << doc }
        end
      end

      tag_map
    end
  end

  # 모든 태그에 대해 TagPage 생성
  class TagGenerator < Generator
    safe true
    priority :low

    def generate(site)
      tags = TagHelper.collect_all_tags(site)
      tags.keys.each do |tag|
        # 태그 이름을 슬러그화: 공백 → -, 대문자 → 소문자
        slug = tag.to_s.downcase.strip.gsub(' ', '-')
        # tags/<slug>/index.html
        dir  = File.join('tags', slug)
        site.pages << TagPage.new(site, site.source, dir, tag)
      end
      # 사이트 전역에서도 사용 가능하도록 저장
      site.config['generated_tags'] = tags
    end
  end
end 