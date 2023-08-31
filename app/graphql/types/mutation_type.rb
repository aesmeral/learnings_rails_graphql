module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :new_post, String, 'Create new Post' do
      argument :title, String
    end

    def new_post(title: )
      Post.create(title:)
      "New Post Created"
    end
  end
end
