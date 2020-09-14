User.seed(:id,
                { id: 1, first_name: 'Shungo', last_name: 'Kusakabe', gender: 'male', email: 'shungo12tennis@gmail.com', birthday: Date.new(1994, 11, 12), phone: '+8108012785302', image_url: 'http://localhost:3000/img/shungo_profile.jpg', encrypted_password: 'passpass' },
                { id: 2, first_name: 'Nobuto', last_name: 'Yanagiya', gender: 'male', email: 'yanagiya@gmail.com', birthday: Date.new(1992, 1, 1), image_url: 'http://localhost:3000/img/yanagiya_profile.jpg', encrypted_password: 'passpass' })
