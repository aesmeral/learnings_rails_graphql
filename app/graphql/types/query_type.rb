module Types
  class QueryType < GraphQL::Schema::Object
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :post, PostType, 'Find a post by ID' do
      argument :id, ID
    end

    field :post_by_name, [PostType], 'Find a post by name' do
      argument :title, String
    end

    field :all_post, [PostType], 'Return all posts'

    def post(id:)
      Post.find(id)
    end

    def all_post
      Post.all
    end

    def post_by_name(title:)
      Post.where('title LIKE ?', "%#{title}%")
    end

  end
end
